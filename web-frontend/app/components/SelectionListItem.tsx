import type { ReactNode } from "react";

type SelectionListItemProps = {
  title: ReactNode;
  subtitle: ReactNode;
  onSelect: () => void;
  action?: ReactNode;
};

export default function SelectionListItem({
  title,
  subtitle,
  onSelect,
  action,
}: SelectionListItemProps) {
  return (
    <div className="neon-card neon-card--row">
      <div className="neon-card__surface neon-card__surface--row">
        <button type="button" onClick={onSelect} className="neon-card__row-select">
          <span className="neon-card__row-title">{title}</span>
          <span className="neon-card__row-subtitle">{subtitle}</span>
        </button>
        {action && <div className="neon-card__row-action">{action}</div>}
      </div>
    </div>
  );
}
