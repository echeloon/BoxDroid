export {};

declare global {
  interface Window {
    BoxDroidBridge: {
      getGames: () => string;
      getSettings: () => string;
      addGame: () => void;
      selectMcpx: () => void;
      selectBios: () => void;
      selectHdd: () => void;
      loadGraphicsDriver: () => void;
      selectGraphicsDriver: (mode: "SYSTEM" | "CUSTOM") => void;
      deleteGraphicsDriver: () => void;
      deleteGame: (position: number) => void;
      clearSetting: (key: string) => void;
      startGame: (uri: string) => void;
    };
  }
}
