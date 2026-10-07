import { Link } from "react-router";
import { useEffect, useState } from "react";
import { ChevronLeft, Gamepad2, Trash2 } from "lucide-react";
import SelectionListItem from "../components/SelectionListItem";

export default function Library() {
  const [games, setGames] = useState<any[]>([]);

  useEffect(() => {
    const loadGames = () => {
      if (window.BoxDroidBridge) {
        setGames(JSON.parse(window.BoxDroidBridge.getGames()));
      }
    };
    loadGames();
    window.addEventListener("games_changed", loadGames);
    return () => window.removeEventListener("games_changed", loadGames);
  }, []);

  return (
    <div className="flex-1 flex flex-col p-6 w-full">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center">
          <Link to="/" className="neon-card neon-card--compact mr-4">
            <span className="neon-card__surface neon-card__surface--compact"><ChevronLeft size={20} /> Back</span>
          </Link>
          <h1 className="text-3xl font-bold">Game Library</h1>
        </div>
        <button 
          onClick={() => window.BoxDroidBridge?.addGame()}
          className="neon-card neon-card--compact"
        >
          <span className="neon-card__surface neon-card__surface--compact">+ Add Game</span>
        </button>
      </div>

      {games.length === 0 ? (
        <div className="neon-card neon-card--row neon-card--empty">
          <div className="neon-card__surface neon-card__surface--row neon-card__empty-copy">
            <Gamepad2 size={24} aria-hidden="true" />
            <span>No games found. Select Add Game to choose an XISO.</span>
          </div>
        </div>
      ) : (
        <div className="flex w-full flex-col gap-4">
          {games.map((game, index) => (
            <SelectionListItem
              key={index}
              title={game.name}
              subtitle={<><Gamepad2 size={18} className="shrink-0 text-green-500" /> Tap to launch</>}
              onSelect={() => window.BoxDroidBridge?.startGame(game.uri)}
              action={(
                <button
                  type="button"
                  aria-label={`Remove ${game.name}`}
                  onClick={() => window.BoxDroidBridge?.deleteGame(index)}
                  className="neon-card neon-card--icon neon-card--danger"
                >
                  <span className="neon-card__surface neon-card__surface--compact"><Trash2 size={20} /></span>
                </button>
              )}
            />
          ))}
        </div>
      )}
    </div>
  );
}
