package uditor

import "core:math"
import rl "vendor:raylib"

WIDTH :: 3000
X :: WIDTH / 2

HEIGHT :: 2000
Y :: HEIGHT / 3

MID_VEC: rl.Vector2 = {X, Y}

TITLE :: "Untitled Editor"
FONT_SIZE :: 20

SIZE :: 500

main :: proc() {
	rl.SetTraceLogLevel(rl.TraceLogLevel.ERROR)
	rl.SetConfigFlags({.VSYNC_HINT})
	rl.SetTargetFPS(60)
	rl.InitWindow(WIDTH, HEIGHT, TITLE)

	MID: f32 = (SIZE * math.SQRT_THREE) / 2
	for !rl.WindowShouldClose() {
		rl.BeginDrawing()
		rl.ClearBackground(rl.BLACK)
		rl.DrawPolyLines(MID_VEC, 6, SIZE, 0, rl.RAYWHITE)
		rl.DrawLineV(MID_VEC, {X, Y + MID}, rl.RED)
		rl.DrawPolyLines({X, Y + (MID * 2)}, 6, SIZE, 0, rl.RAYWHITE)
		rl.EndDrawing()
	}

	rl.CloseWindow()
}
