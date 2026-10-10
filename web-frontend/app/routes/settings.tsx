import { Link, useLocation, useNavigate } from "react-router";
import { useEffect, useState } from "react";
import { ChevronLeft, CheckCircle2, XCircle, Trash2 } from "lucide-react";
import SelectionListItem from "../components/SelectionListItem";

export default function Settings() {
  const path = useLocation().pathname;
  const navigate = useNavigate();
  const system = path === "/settings/system-files";
  const graphics = path === "/settings/graphics";
  const driverPage = path === "/settings/graphics/driver";
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

  const driver = settings?.graphicsDriver;
  const back = system || graphics ? "/settings" : driverPage ? "/settings/graphics" : "/";
  const title = system ? "Load System Files" : graphics ? "Performance & Graphics" : driverPage ? "Graphics Driver" : "System Settings";

  return (
    <div className="flex-1 flex flex-col p-6 w-full">
      <div className="flex items-center mb-8 gap-4">
        <Link to={back} className="neon-card neon-card--compact">
          <span className="neon-card__surface neon-card__surface--compact">
            <ChevronLeft size={20} /> Back
          </span>
        </Link>
        <h1 className="text-3xl font-bold">{title}</h1>
      </div>

      <div className="flex flex-col gap-4 w-full">
        {!system && !graphics && !driverPage && <>
          <SelectionListItem title="Load System Files" subtitle="BIOS, MCPX and HDD" onSelect={() => navigate("/settings/system-files")} />
          <SelectionListItem title="Performance & Graphics" subtitle="Graphics Driver" onSelect={() => navigate("/settings/graphics")} />
        </>}
        {graphics && <SelectionListItem title="Graphics Driver" subtitle={driver?.mode === "CUSTOM" ? driver?.displayName : "System Driver"} onSelect={() => navigate("/settings/graphics/driver")} />}
        {driverPage && <>
          <SelectionListItem title="System Driver" subtitle={driver?.mode !== "CUSTOM" ? "Active" : "Use Android's Vulkan driver"} onSelect={() => window.BoxDroidBridge?.selectGraphicsDriver("SYSTEM")} />
          {driver?.installed && <SelectionListItem title={driver.displayName} subtitle={<><span>Custom Driver{driver.mode === "CUSTOM" ? " · Active" : ""}</span>{driver.metadata?.driverVersion && <span> · {driver.metadata.driverVersion}</span>}</>} onSelect={() => window.BoxDroidBridge?.selectGraphicsDriver("CUSTOM")} action={
            <button type="button" disabled={driver.busy} aria-label="Delete custom graphics driver" onClick={() => window.BoxDroidBridge?.deleteGraphicsDriver()} className="neon-card neon-card--icon neon-card--danger"><span className="neon-card__surface neon-card__surface--compact"><Trash2 size={20} color="#ff7783" /></span></button>
          } />}
          <SelectionListItem title="Load Driver" subtitle={<span className="truncate" role={driver?.error ? "alert" : undefined} title={driver?.error}>{driver?.busy ? "Validating driver…" : driver?.error || "Select a compatible driver ZIP"}</span>} onSelect={() => !driver?.busy && window.BoxDroidBridge?.loadGraphicsDriver()} />
        </>}
        {system && <>
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
        </>}
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
