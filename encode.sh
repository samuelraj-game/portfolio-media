#!/bin/sh
# Builds the web reels served by GitHub Pages (each under GitHub's 100 MB file limit).
P=E:/05_Portfolio/portfolio-site
O=E:/05_Portfolio/portfolio-media/media
cp "$P/public/media/showreel/samuel-raj-showreel-2026.mp4" "$O/showreel-2026.mp4"
cp "$P/public/media/showreel/2025-cinematic-showreel.mp4" "$O/cinematic-showreel-2025.mp4"
cp "$P/public/media/mayanagari/mayanagari-ld-breakdown.mp4" "$O/mayanagari-ld-breakdown.mp4"
cp "$P/public/media/the-soldier-within/chapter-1-mission-1.mp4" "$O/tsw-chapter-1-mission-1.mp4"
enc() { # src out videokbps
  ffmpeg -y -v error -i "$1" -vf "scale=-2:'min(720,ih)'" -c:v libx264 -preset slow -b:v "$3k" -maxrate "$(( $3 * 2 ))k" -bufsize "$(( $3 * 4 ))k" -pix_fmt yuv420p -fpsmax 30 -c:a aac -b:a 96k -movflags +faststart "$O/$2"
}
enc "$P/public/media/the-soldier-within/level-design-demoreel.mp4" tsw-level-design-demoreel.mp4 850
enc "$P/assets/mayanagari/mayanagari-highlight-reel-web.mp4" mayanagari-highlight-reel.mp4 2400
enc "$P/assets/mayanagari/mayanagari-mission-vertical-slice-web.mp4" mayanagari-mission-vertical-slice.mp4 1900
ls -la "$O"
