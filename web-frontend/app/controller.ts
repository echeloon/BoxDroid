// Controller navigation for the frontend. FrontendActivity forwards D-pad,
// hat, stick and A presses as window.boxDroidController(action).
//
// Up/down move between rows (a row's main button stands for the row);
// left/right step through every item, reaching a row's secondary action.
// The selection is kept here rather than inferred from the DOM, so a page
// change or a re-render never leaves A pointing at a stale or hidden item.

type Action = "up" | "down" | "left" | "right" | "activate";

const ITEMS = "a[href], button:not(:disabled), [role=button], input:not(:disabled), select:not(:disabled), textarea:not(:disabled)";
const SELECTED = "controller-selected";
const MODE = "controller-mode";

let selected: HTMLElement | null = null;
// The selection was placed for the user (page change), not moved by them.
let automatic = false;

function visibleItems(): HTMLElement[] {
  return Array.from(document.querySelectorAll<HTMLElement>(ITEMS))
    .filter((item) => item.getClientRects().length > 0);
}

function isRowSecondary(item: HTMLElement): boolean {
  return !!item.closest(".neon-card--row") && !item.matches(".neon-card__row-select");
}

function isBack(item: HTMLElement): boolean {
  return item.matches("a[href]") && item.textContent?.trim() === "Back";
}

/** The first row's main button, else the first item that isn't Back. */
function defaultItem(items: HTMLElement[]): HTMLElement | undefined {
  return items.find((item) => item.matches(".neon-card__row-select"))
    ?? items.find((item) => !isBack(item))
    ?? items[0];
}

function clearHighlight() {
  document.querySelectorAll("." + SELECTED).forEach((item) => item.classList.remove(SELECTED));
}

function select(target: HTMLElement, auto = false) {
  clearHighlight();
  selected = target;
  automatic = auto;
  target.classList.add(SELECTED);
  (target.closest(".neon-card--row") ?? target.closest(".neon-card"))?.classList.add(SELECTED);
  target.focus({ preventScroll: true });
  target.scrollIntoView({ block: "nearest", inline: "nearest" });
}

function handle(action: Action) {
  document.body.classList.add(MODE);
  const items = visibleItems();
  if (!items.length) return;
  const current = selected && document.contains(selected) && items.includes(selected) ? selected : null;
  if (!current) {
    // Nothing selected yet, or the page changed: show where we are first.
    const first = defaultItem(items);
    if (first) select(first, true);
    return;
  }
  if (action === "activate") {
    current.click();
    return;
  }
  const vertical = action === "up" || action === "down";
  const candidates = vertical ? items.filter((item) => !isRowSecondary(item)) : items;
  const anchor = vertical && isRowSecondary(current)
    ? current.closest(".neon-card--row")?.querySelector<HTMLElement>(".neon-card__row-select") ?? current
    : current;
  const index = candidates.indexOf(anchor);
  const forward = action === "down" || action === "right";
  const next = index < 0 ? 0 : (index + (forward ? 1 : candidates.length - 1)) % candidates.length;
  select(candidates[next]);
}

export function installController() {
  (window as Window & { boxDroidController?: (action: Action) => void }).boxDroidController = handle;
  // Touch takes over from the controller: drop its highlight.
  window.addEventListener("pointerdown", () => {
    document.body.classList.remove(MODE);
    clearHighlight();
    selected = null;
  }, true);
  // After a page change, keep a visible selection while the controller is in use.
  // Lists load after their page, so an automatic choice follows the content
  // (the library's first game) until the user moves.
  new MutationObserver(() => {
    if (!document.body.classList.contains(MODE)) return;
    const attached = selected && document.contains(selected);
    if (attached && !automatic) return;
    const first = defaultItem(visibleItems());
    if (first && first !== selected) select(first, true);
  }).observe(document.body, { childList: true, subtree: true });
}
