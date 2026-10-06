import { Link } from "react-router";
import { useEffect, useState } from "react";
import { ChevronLeft, CheckCircle2, XCircle, Trash2 } from "lucide-react";

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
    <div className="flex-1 flex flex-col p-6 max-w-4xl mx-auto w-full">
      <div className="flex items-center mb-8 gap-4">
        <Link to="/" className="px-4 py-2 bg-gray-700 rounded flex items-center gap-2">
          <ChevronLeft size={20} /> Back
        </Link>
        <h1 className="text-3xl font-bold">System Settings</h1>
      </div>

      <div className="flex flex-col space-y-4 max-w-2xl w-full">
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
    <div className="bg-gray-800 p-4 rounded flex items-center justify-between shadow-lg" style={{ backgroundColor: '#1f2937' }}>
      <div className="flex-1 flex flex-col cursor-pointer" onClick={onSelect}>
        <span className="text-sm text-gray-400" style={{ color: '#9ca3af' }}>{title}</span>
        <div className="flex items-center gap-2 mt-1">
          {item?.isSet ? (
            <CheckCircle2 size={20} className="text-green-500" style={{ color: '#22c55e' }} />
          ) : (
            <XCircle size={20} className="text-red-500" style={{ color: '#ef4444' }} />
          )}
          <span className="text-lg" style={{ color: item?.isSet ? '#ffffff' : '#9ca3af' }}>
            {item?.name || "Loading..."}
          </span>
        </div>
      </div>
      {item?.isSet && (
        <button onClick={onClear} className="ml-4 p-2 bg-red-600 rounded text-white flex items-center justify-center" style={{ backgroundColor: '#dc2626' }}>
          <Trash2 size={20} />
        </button>
      )}
    </div>
  );
}

