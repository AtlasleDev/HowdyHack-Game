using Godot;
using System;

public partial class MouseInputChecker : Node
{
	public override void _Process(double delta)
	{
		// Check if the left mouse button is currently pressed
		if (Input.IsMouseButtonPressed(MouseButton.Left))
		{
			GD.Print("Left mouse button is pressed.");
		}

		// Get the global mouse position
		// Vector2 mousePosition = GetGlobalMousePosition();
		// GD.Print($"Mouse Position: {mousePosition}");
	}
}
