import { Link } from "react-router";
import { useEffect, useState } from "react";

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
    <div className="flex-1 flex flex-col p-6">
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
        <div className="grid gap-4 grid-cols-1 md:grid-cols-2">
          {games.map((game, index) => (
            <div key={index} className="bg-gray-800 p-4 rounded flex items-center justify-between">
              <div 
                className="flex-1 cursor-pointer" 
                onClick={() => window.BoxDroidBridge?.startGame(game.uri)}
              >
                <h3 className="text-xl font-semibold">{game.name}</h3>
              </div>
              <button 
                onClick={(e) => { e.stopPropagation(); window.BoxDroidBridge?.deleteGame(index); }} 
                className="ml-4 p-2 bg-red-600 rounded"
              >
                Delete
              </button>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}
