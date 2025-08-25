package uditor

import "core:math"
import raylib "vendor:raylib"

WIDTH :: 3000
X :: WIDTH / 2

HEIGHT :: 2000
Y :: HEIGHT / 3

MID_VEC: raylib.Vector2 = {X, Y}

TITLE :: "Untitled Editor"
FONT_SIZE :: 20

SIZE :: 500

main :: proc() {
	raylib.SetTraceLogLevel(raylib.TraceLogLevel.ERROR)
	raylib.SetConfigFlags({.VSYNC_HINT})
	raylib.SetTargetFPS(60)
	raylib.InitWindow(WIDTH, HEIGHT, TITLE)

	camera: raylib.Camera2D = {
		offset   = {0, 0},
		target   = {0, 0},
		rotation = 0,
		zoom     = 1,
	}

	MID: f32 = (SIZE * math.SQRT_THREE) / 2
	for !raylib.WindowShouldClose() {
		raylib.BeginDrawing()

		raylib.BeginMode2D(camera)

		raylib.ClearBackground(raylib.BLACK)
		raylib.DrawPolyLines(MID_VEC, 6, SIZE, 0, raylib.RAYWHITE)
		raylib.DrawLineV(MID_VEC, {X, Y + MID}, raylib.RED)
		raylib.DrawPolyLines({X, Y + (MID * 2)}, 6, SIZE, 0, raylib.RAYWHITE)

		raylib.EndMode2D()

		raylib.EndDrawing()
	}

	raylib.CloseWindow()
}
