shader_type canvas_item;

uniform int type : hint_range(0, 3, 1) = 0;
uniform vec3 color : source_color = vec3(1.0);
uniform float range : hint_range(0.0, 0.95, 0.01) = 0.7;
uniform float intensity : hint_range(0.0, 1.0, 0.05) = 0.5;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;


void fragment() {
	vec4 color_texture = texture(SCREEN_TEXTURE, SCREEN_UV);
	vec4 final_color = vec4(0.0);
	
	if (type == 0)
		final_color = mix(color_texture, vec4(color, 1.0), smoothstep(range, 1.0, UV.x) * intensity);
	else if (type == 1)
		final_color = mix(color_texture, vec4(color, 1.0), smoothstep(range, 1.0, UV.y) * intensity);
	else if (type == 2)
		final_color = mix(color_texture, vec4(color, 1.0), smoothstep(1.0 - range, 0.0, UV.x) * intensity);
	else
		final_color = mix(color_texture, vec4(color, 1.0), smoothstep(1.0 - range, 0.0, UV.y) * intensity);
	
	COLOR = final_color;
}
