import { motion } from "framer-motion";
import { Outlet } from "react-router";

export default function MatrixLayout() {
  return (
    <div className="matrix-layout">
      <div className="matrix-scene" aria-label="Full-screen green ABXY code rain" role="img">
        <div className="matrix-scanlines" />
        <motion.div
          className="matrix-sweep"
          aria-hidden="true"
          animate={{ y: ["-10%", "110%"], opacity: [0, 0.75, 0] }}
          transition={{ duration: 4.8, repeat: Infinity, ease: "linear" }}
        />
        <div className="matrix-rain" aria-hidden="true">
          {Array.from({ length: 32 }, (_, i) => (
            <motion.div
              className="matrix-column"
              key={i}
              initial={{ y: `${(i % 5) * -22}%` }}
              animate={{ y: ["-110%", "110%"] }}
              transition={{ duration: 3.6 + (i % 6) * 0.55, repeat: Infinity, delay: (i % 7) * -0.62, ease: "linear" }}
              style={{ left: `${1.5 + i * 3.1}%` }}
            >
              {Array.from({ length: 11 }, (_, j) => (
                <span key={j} style={{ opacity: Math.max(0.18, 1 - j * 0.08) }}>
                  {"ABXY"[(i * 3 + j * 7) % 4]}
                </span>
              ))}
            </motion.div>
          ))}
        </div>
      </div>
      <div className="matrix-route">
        <Outlet />
      </div>
    </div>
  );
}
