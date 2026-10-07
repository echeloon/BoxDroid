import { useEffect, useRef } from "react";
import { Outlet } from "react-router";
import { AsciiRain } from "../components/neonblade-ui/ascii-rain";

function AsciiRain() {
  const canvasRef = useRef<HTMLCanvasElement>(null);

  useEffect(() => {
    const canvas = canvasRef.current;
    const context = canvas?.getContext("2d");
    if (!canvas || !context) return;

    let width = 0;
    let height = 0;
    let frame = 0;
    let lastFrame = 0;
    let fontSize = 18;
    let streams: Array<{ x: number; y: number; speed: number; seed: number }> = [];

    const resize = () => {
      const bounds = canvas.getBoundingClientRect();
      width = bounds.width;
      height = bounds.height;
      const pixelRatio = Math.min(window.devicePixelRatio || 1, 1.5);
      canvas.width = Math.round(width * pixelRatio);
      canvas.height = Math.round(height * pixelRatio);
      context.setTransform(pixelRatio, 0, 0, pixelRatio, 0, 0);
      fontSize = Math.max(14, Math.min(20, width * 0.0105));
      const count = Math.max(12, Math.min(28, Math.floor(width / (fontSize * 4))));
      streams = Array.from({ length: count }, (_, index) => ({
        x: ((index + 0.5) / count) * width,
        y: Math.random() * height,
        speed: 2 + Math.random() * 2.5,
        seed: Math.floor(Math.random() * 4),
      }));
    };

    const draw = (time: number) => {
      frame = window.requestAnimationFrame(draw);
      if (time - lastFrame < 33) return;
      const step = lastFrame === 0 ? 1 : Math.min((time - lastFrame) / 16.7, 3);
      lastFrame = time;
      context.clearRect(0, 0, width, height);
      context.font = `700 ${fontSize}px monospace`;
      context.textAlign = "center";
      context.textBaseline = "middle";

      streams.forEach((stream, column) => {
        stream.y += stream.speed * step;
        if (stream.y - fontSize * 10 > height) {
          stream.y = -Math.random() * height * 0.45;
          stream.seed = Math.floor(Math.random() * 4);
        }
        for (let row = 0; row < 10; row += 1) {
          const character = "ABXY"[(stream.seed + column * 3 + Math.floor(stream.y / fontSize) + row * 3) % 4];
          context.globalAlpha = row === 0 ? 0.9 : Math.max(0.12, 0.72 - row * 0.065);
          context.fillStyle = row === 0 ? "#d5ffd9" : "#56ff70";
          context.fillText(character, stream.x, stream.y - row * fontSize);
        }
      });
      context.globalAlpha = 1;
    };

    resize();
    frame = window.requestAnimationFrame(draw);
    window.addEventListener("resize", resize);
    return () => {
      window.cancelAnimationFrame(frame);
      window.removeEventListener("resize", resize);
    };
  }, []);

  return <canvas ref={canvasRef} className="matrix-rain-canvas" aria-hidden="true" />;
}

export default function MatrixLayout() {
  return (
    <div className="matrix-layout">
      <div className="matrix-scene" aria-label="Full-screen green ABXY code rain" role="img">
        <AsciiRain />
      </div>
      <div className="matrix-route">
        <Outlet />
      </div>
    </div>
  );
}
