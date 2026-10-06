import { Link } from "react-router";
import { useEffect, useState } from "react";
import { Gamepad2, Trash2 } from "lucide-react";
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
          <Link to="/" className="mr-4 px-4 py-2 bg-gray-700 rounded">&lt; Back</Link>
          <h1 className="text-3xl font-bold">Game Library</h1>
        </div>
        <button 
          onClick={() => window.BoxDroidBridge?.addGame()}
          className="px-4 py-2 bg-green-600 rounded"
        >
          + Add Game
        </button>
      </div>

      {games.length === 0 ? (
        <div className="flex-1 flex items-center justify-center text-gray-400">
          No games found. Click Add Game to select an xiso.
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
                  className="p-2 bg-red-600 rounded text-white flex items-center justify-center"
                >
                  <Trash2 size={20} />
                </button>
              )}
            />
          ))}
        </div>
      )}
    </div>
  );
}
