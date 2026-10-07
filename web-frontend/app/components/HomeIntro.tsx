import { useEffect, useState, type CSSProperties } from "react";
import { AnimatePresence, motion, useReducedMotion } from "framer-motion";

type ButtonToken = {
  id: number;
  label: string;
  color: string;
  side: "left" | "bottom" | "right" | "top";
  x: number;
  y: number;
  rotation: number;
  delay: number;
  scale: number;
};

const buttonStyles = [
  { label: "A", color: "#69d54b" },
  { label: "B", color: "#f04a48" },
  { label: "X", color: "#4287ff" },
  { label: "Y", color: "#f2c94c" },
];

let introHasPlayedInDocument = false;

function createTokens(): ButtonToken[] {
  const width = window.innerWidth;
  const height = window.innerHeight;
  const buttonSize = 72;
  const sides: ButtonToken["side"][] = ["left", "bottom", "right", "top"];

  return buttonStyles.map((button, id) => {
    const edgePosition = Math.random() * 0.7 + 0.15;
    let x = 0;
    let y = 0;
    const side = sides[id] ?? "left";

    if (side === "left") {
      x = -width / 2 - buttonSize;
      y = edgePosition * height - height / 2;
    } else if (side === "bottom") {
      x = edgePosition * width - width / 2;
      y = height / 2 + buttonSize;
    } else if (side === "right") {
      x = width / 2 + buttonSize;
      y = edgePosition * height - height / 2;
    } else {
      x = edgePosition * width - width / 2;
      y = -height / 2 - buttonSize;
    }

    return {
      id,
      label: button.label,
      color: button.color,
      side,
      x,
      y,
      rotation: Math.random() * 90 - 45,
      delay: id * 0.035,
      scale: 0.92 + Math.random() * 0.28,
    };
  });
}

export function HomeIntro() {
  const reduceMotion = useReducedMotion();
  const [tokens, setTokens] = useState<ButtonToken[]>([]);
  const [visible, setVisible] = useState(() => !introHasPlayedInDocument);
  const [showWelcome, setShowWelcome] = useState(false);

  useEffect(() => {
    if (!visible) return;

    introHasPlayedInDocument = true;
    setTokens(createTokens());
    setShowWelcome(false);
    const revealTimeout = window.setTimeout(() => setShowWelcome(true), reduceMotion ? 100 : 1420);
    const timeout = window.setTimeout(() => setVisible(false), reduceMotion ? 1500 : 3400);
    return () => {
      window.clearTimeout(revealTimeout);
      window.clearTimeout(timeout);
    };
  }, [reduceMotion, visible]);

  return (
    <AnimatePresence>
      {visible && (
        <motion.div
          className="home-intro"
          aria-label="Welcome to BoxDroid"
          role="status"
          initial={{ opacity: 1 }}
          exit={{ opacity: 0, transition: { duration: 0.65, ease: "easeInOut" } }}
        >
          <div className="home-intro__grid" />
          <motion.div
            className="home-intro__aura"
            initial={{ scale: 0.35, opacity: 0 }}
            animate={{ scale: [0.35, 1, 1.15], opacity: [0, 0.72, 0.42] }}
            transition={{ duration: 2.1, times: [0, 0.65, 1], ease: "easeOut" }}
          />

          {tokens.map((token) => (
            <motion.div
              key={token.id}
              className={`home-intro__button-wrap home-intro__button-wrap--${token.side}`}
              initial={{ x: token.x, y: token.y, rotate: 0, scale: 0.82, opacity: 1 }}
              animate={
                reduceMotion
                  ? { x: 0, y: 0, rotate: 0, scale: 1, opacity: 0 }
                  : {
                      x: [token.x, token.x * 0.35, 0, 0],
                      y: [token.y, token.y * 0.35, 0, 0],
                      rotate: [0, token.rotation, token.rotation, 0],
                      scale: [0.82, token.scale, 1.12, 0.08],
                      opacity: [1, 1, 1, 0],
                    }
              }
              transition={{
                duration: reduceMotion ? 0.4 : 1.35,
                delay: token.delay,
                times: [0, 0.68, 0.82, 1],
                ease: [0.16, 0.78, 0.24, 1],
              }}
              style={{ "--button-color": token.color } as CSSProperties}
            >
              <span className="home-intro__button">{token.label}</span>
            </motion.div>
          ))}

          {!reduceMotion && (
            <motion.div
              className="home-intro__burst"
              initial={{ scale: 0.15, opacity: 0 }}
              animate={{ scale: [0.15, 1.4, 1.9], opacity: [0, 1, 0] }}
              transition={{ delay: 1.23, duration: 0.72, times: [0, 0.2, 1], ease: "easeOut" }}
            >
              {Array.from({ length: 28 }, (_, i) => {
                const angle = ((i / 28) * 360 + (i % 3) * 7) * (Math.PI / 180);
                const distance = 72 + ((i * 47) % 170);
                const x = Math.cos(angle) * distance;
                const y = Math.sin(angle) * distance;
                return (
                  <motion.i
                    key={i}
                    style={{ "--spark-color": buttonStyles[i % buttonStyles.length].color } as CSSProperties}
                    initial={{ opacity: 0, scale: 0 }}
                    animate={{ x: [0, x * 0.72, x], y: [0, y * 0.72, y], opacity: [0, 1, 0], scale: [0, 1, 0] }}
                    transition={{ delay: 1.25, duration: 0.7, ease: "easeOut" }}
                  />
                );
              })}
              <motion.span
                className="home-intro__shockwave"
                initial={{ scale: 0.2, opacity: 0.9 }}
                animate={{ scale: 1.4, opacity: 0 }}
                transition={{ delay: 1.25, duration: 0.65, ease: "easeOut" }}
              />
            </motion.div>
          )}

          <motion.div
            className="home-intro__welcome"
            initial={{ opacity: 0, y: 24, scale: 0.9, filter: "blur(12px)" }}
            animate={showWelcome
              ? { opacity: 1, y: 0, scale: 1, filter: "blur(0px)" }
              : { opacity: 0, y: 24, scale: 0.9, filter: "blur(12px)" }}
            transition={{
              duration: reduceMotion ? 0.5 : 0.72,
              type: "spring",
              stiffness: 120,
              damping: 18,
            }}
          >
            <h2>Welcome to BoxDroid</h2>
            <span className="home-intro__underline" />
          </motion.div>
        </motion.div>
      )}
    </AnimatePresence>
  );
}
