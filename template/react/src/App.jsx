import { useRive } from "@rive-app/react-canvas";

function App() {
  const { rive, RiveComponent } = useRive({
    src: '/input.riv',
    autoplay: true,
    autobind: true,
    fit: 'layout',
    layoutScaleFactor: 1,
    onLoad: () => {
      rive?.resizeDrawingSurfaceToCanvas();
    },
  });

  return (
    <div style={{ width: '100vw', height: '100vh', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
      <RiveComponent
        style={{ width: '800px', height: '600px' }}
        onMouseEnter={() => rive && rive.play()}
        onMouseLeave={() => rive && rive.pause()}
      />
    </div>
  );
}

export default App;

