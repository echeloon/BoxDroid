import { motion } from "framer-motion";
import { Outlet } from "react-router";
import { AsciiRain } from "../components/neonblade-ui/ascii-rain";

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
        <AsciiRain
          textColor="#56ff70"
          bgColor="rgba(3, 8, 6, 0.08)"
          fontSize={18}
          speed={42}
          characters="ABXY"
          opacity={55}
        />
      </div>
      <div className="matrix-route">
        <Outlet />
      </div>
    </div>
  );
}
