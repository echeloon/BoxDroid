import { Link } from "react-router";
import { useEffect, useState } from "react";
import { Gamepad2, Settings } from "lucide-react";

export default function Index() {
  const [canPlay, setCanPlay] = useState(false);

  useEffect(() => {
    const checkSettings = () => {
      if (window.BoxDroidBridge) {
        try {
          const settings = JSON.parse(window.BoxDroidBridge.getSettings());
          setCanPlay(settings.mcpx_uri.isSet && settings.bios_uri.isSet && settings.hdd_uri.isSet);
        } catch (e) {
          console.error(e);
        }
      }
    };
    
    checkSettings();
    window.addEventListener("settings_changed", checkSettings);
    return () => window.removeEventListener("settings_changed", checkSettings);
  }, []);

  return (
    <div className="home-content flex-1 flex flex-col items-center space-y-6" style={{ paddingTop: '20vh' }}>
      <h1 className="text-4xl font-bold mb-8">BoxDroid</h1>
      
      {canPlay ? (
        <Link to="/library" className="px-8 py-4 bg-green-600 rounded text-xl w-64 text-center flex items-center justify-center gap-2">
          <Gamepad2 /> Play Games
        </Link>
      ) : (
        <button
          onClick={() => alert("Load BIOS, MCPX and HDD Image first in Settings.")}
          className="px-8 py-4 bg-gray-600 rounded text-xl w-64 text-center opacity-50 cursor-not-allowed flex items-center justify-center gap-2"
        >
          <Gamepad2 /> Play Games
        </button>
      )}

      <Link to="/settings" className="px-8 py-4 bg-blue-600 rounded text-xl w-64 text-center flex items-center justify-center gap-2 mt-4">
        <Settings /> Settings
      </Link>

    </div>
  );
}
