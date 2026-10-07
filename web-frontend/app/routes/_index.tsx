import { Link } from "react-router";
import { useEffect, useState } from "react";
import { ArrowRight, Gamepad2, Settings } from "lucide-react";
import { HomeIntro } from "../components/HomeIntro";

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
    <>
      <HomeIntro />
      <main className="home-content home-menu">
        <h1 className="home-brand">BoxDroid</h1>
        <div className="home-menu__options">
          {canPlay ? (
            <Link to="/library" className="neon-card" aria-label="Play Games">
              <span className="neon-card__surface">
                <span className="neon-card__icon"><Gamepad2 aria-hidden="true" /></span>
                <span className="neon-card__copy">
                  <span className="neon-card__title">Play Games</span>
                  <span className="neon-card__subtitle">Enter your game library</span>
                </span>
                <ArrowRight className="neon-card__arrow" aria-hidden="true" />
              </span>
            </Link>
          ) : (
            <button
              onClick={() => alert("Load BIOS, MCPX and HDD Image first in Settings.")}
              className="neon-card neon-card--disabled"
              aria-label="Play Games, configure system files in Settings first"
            >
              <span className="neon-card__surface">
                <span className="neon-card__icon"><Gamepad2 aria-hidden="true" /></span>
                <span className="neon-card__copy">
                  <span className="neon-card__title">Play Games</span>
                  <span className="neon-card__subtitle">System files required</span>
                </span>
                <ArrowRight className="neon-card__arrow" aria-hidden="true" />
              </span>
            </button>
          )}

          <Link to="/settings" className="neon-card neon-card--settings">
            <span className="neon-card__surface">
              <span className="neon-card__icon"><Settings aria-hidden="true" /></span>
              <span className="neon-card__copy">
                <span className="neon-card__title">Settings</span>
                <span className="neon-card__subtitle">Configure your system</span>
              </span>
              <ArrowRight className="neon-card__arrow" aria-hidden="true" />
            </span>
          </Link>
        </div>
      </main>
    </>
  );
}
