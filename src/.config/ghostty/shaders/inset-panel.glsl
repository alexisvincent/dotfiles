// Ghostty inset-panel experiment. Uses 10-point padding and a 20-pixel inset at 2x.
// No texture movement: glyphs, selections and mouse coordinates stay aligned.
// Dimensions below are framebuffer pixels, not macOS points.
float roundedPanelDistance(vec2 p, vec2 halfSize, float radius) {
    vec2 q = abs(p) - halfSize + vec2(radius);
    return length(max(q, vec2(0.0))) + min(max(q.x, q.y), 0.0) - radius;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 size = iResolution.xy;
    vec4 source = texture(iChannel0, fragCoord / size);

    // The surround is decoration only; terminal pixels retain their real colours.
    vec3 surroundColor = vec3(21.0, 22.0, 30.0) / 255.0;

    // 20 framebuffer pixels is 10 points with 2x display scaling.
    float inset = min(20.0, min(size.x, size.y) * 0.05);
    vec2 halfSize = max(size * 0.5 - vec2(inset), vec2(1.0));
    float radius = min(24.0, min(halfSize.x, halfSize.y));
    vec2 p = fragCoord - size * 0.5;
    float distanceToPanel = roundedPanelDistance(p, halfSize, radius);
    float panelMask = 1.0 - smoothstep(-0.75, 0.75, distanceToPanel);

    // Flat panels with a restrained teal outline, inspired by the reference.
    // Put the stroke outside the content boundary so it does not cover glyphs.
    vec3 borderIdle = vec3(35.0, 65.0, 73.0) / 255.0;
    vec3 borderFocused = vec3(46.0, 101.0, 113.0) / 255.0;
    vec3 borderColor = iFocus > 0 ? borderFocused : borderIdle;
    float outline = smoothstep(-0.75, 0.75, distanceToPanel)
        * (1.0 - smoothstep(1.25, 2.75, distanceToPanel));

    // Preserve the native application image and its extended bottom fill.
    vec3 result = mix(surroundColor, source.rgb, panelMask);
    result = mix(result, borderColor, outline);
    fragColor = vec4(result, source.a);
}
