import { Link } from "react-router";
import { useEffect, useState } from "react";
import { ChevronLeft, CheckCircle2, XCircle, Trash2 } from "lucide-react";
import SelectionListItem from "../components/SelectionListItem";

export default function Settings() {
  const [settings, setSettings] = useState<any>(null);

  useEffect(() => {
    const loadSettings = () => {
      if (window.BoxDroidBridge) {
        setSettings(JSON.parse(window.BoxDroidBridge.getSettings()));
      }
    };
    loadSettings();
    window.addEventListener("settings_changed", loadSettings);
    return () => window.removeEventListener("settings_changed", loadSettings);
  }, []);

  return (
    <div className="flex-1 flex flex-col p-6 w-full">
      <div className="flex items-center mb-8 gap-4">
        <Link to="/" className="neon-card neon-card--compact">
          <span className="neon-card__surface neon-card__surface--compact">
            <ChevronLeft size={20} /> Back
          </span>
        </Link>
        <h1 className="text-3xl font-bold">System Settings</h1>
      </div>

      <div className="flex flex-col gap-4 w-full">
        <SettingItem
          title="MCPX Image"
          item={settings?.mcpx_uri}
          onSelect={() => window.BoxDroidBridge?.selectMcpx()}
          onClear={() => window.BoxDroidBridge?.clearSetting("mcpx_uri")}
        />
        <SettingItem
          title="BIOS Image"
          item={settings?.bios_uri}
          onSelect={() => window.BoxDroidBridge?.selectBios()}
          onClear={() => window.BoxDroidBridge?.clearSetting("bios_uri")}
        />
        <SettingItem
          title="HDD Image"
          item={settings?.hdd_uri}
          onSelect={() => window.BoxDroidBridge?.selectHdd()}
          onClear={() => window.BoxDroidBridge?.clearSetting("hdd_uri")}
        />
      </div>
    </div>
  );
}

function SettingItem({ title, item, onSelect, onClear }: any) {
  return (
    <SelectionListItem
      title={title}
      subtitle={
        <>
          {item?.isSet ? (
            <CheckCircle2 size={20} className="shrink-0 text-green-500" />
          ) : (
            <XCircle size={20} className="shrink-0 text-red-500" />
          )}
          <span className="truncate">{item?.name || "Loading..."}</span>
        </>
      }
      onSelect={onSelect}
      action={item?.isSet && (
        <button type="button" aria-label={`Clear ${title}`} onClick={onClear} className="neon-card neon-card--icon neon-card--danger">
          <span className="neon-card__surface neon-card__surface--compact">
            <Trash2 size={20} />
          </span>
        </button>
      )}
    />
  );
}
