import { useEffect, useRef } from "react";

export interface AsciiRainProps {
  textColor?: string;
  bgColor?: string;
  fontSize?: number;
  speed?: number;
  characters?: string;
  opacity?: number;
}

/** Adapted from NeonBlade UI's MIT licensed Ascii Rain component. */
export function AsciiRain({
  textColor = "#56ff70",
  bgColor = "rgba(3, 8, 6, 0.08)",
  fontSize = 18,
  speed = 42,
  characters = "ABXY",
  opacity = 72,
}: AsciiRainProps) {
  const canvasRef = useRef<HTMLCanvasElement>(null);

  useEffect(() => {
    const canvas = canvasRef.current;
    const context = canvas?.getContext("2d");
    if (!canvas || !context) return;

    const resizeCanvas = () => {
      canvas.width = canvas.offsetWidth;
      canvas.height = canvas.offsetHeight;
    };

    resizeCanvas();
    window.addEventListener("resize", resizeCanvas);

    const characterList = characters.split("");
    const drops = Array.from(
      { length: Math.ceil(canvas.width / fontSize) },
      () => (Math.random() * canvas.height) / fontSize,
    );

    const draw = () => {
      context.fillStyle = bgColor;
      context.fillRect(0, 0, canvas.width, canvas.height);

      context.fillStyle = textColor;
      context.font = `${fontSize}px monospace`;
      context.shadowColor = textColor;
      context.shadowBlur = fontSize * 0.45;

      const currentColumnCount = Math.ceil(canvas.width / fontSize);
      while (drops.length < currentColumnCount) {
        drops.push((Math.random() * canvas.height) / fontSize);
      }

      for (let column = 0; column < drops.length; column += 1) {
        const character = characterList[Math.floor(Math.random() * characterList.length)];
        context.fillText(character, column * fontSize, drops[column] * fontSize);

        if (drops[column] * fontSize > canvas.height && Math.random() > 0.975) {
          drops[column] = 0;
        }

        drops[column] += 1;
      }

      context.shadowBlur = 0;
    };

    const interval = window.setInterval(draw, speed);

    return () => {
      window.clearInterval(interval);
      window.removeEventListener("resize", resizeCanvas);
    };
  }, [textColor, bgColor, fontSize, speed, characters]);

  return (
    <div className="ascii-rain-layer" aria-hidden="true">
      <canvas ref={canvasRef} className="ascii-rain-layer__canvas" style={{ opacity: opacity / 100 }} />
    </div>
  );
}
