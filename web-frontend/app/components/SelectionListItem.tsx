import type { ReactNode } from "react";

type SelectionListItemProps = {
  title: ReactNode;
  subtitle: ReactNode;
  onSelect: () => void;
  action?: ReactNode;
  titleClassName?: string;
  subtitleClassName?: string;
};

export default function SelectionListItem({
  title,
  subtitle,
  onSelect,
  action,
  titleClassName = "text-lg font-semibold",
  subtitleClassName = "text-sm text-gray-400",
}: SelectionListItemProps) {
  return (
    <div className="bg-gray-800 p-4 rounded flex items-center justify-between shadow-lg w-full" style={{ backgroundColor: "#1f2937" }}>
      <button type="button" onClick={onSelect} className="flex min-w-0 flex-1 flex-col items-start text-left">
        <span className={titleClassName}>{title}</span>
        <span className={`mt-1 flex min-w-0 items-center gap-2 ${subtitleClassName}`}>{subtitle}</span>
      </button>
      {action && <div className="ml-4 shrink-0">{action}</div>}
    </div>
  );
}
