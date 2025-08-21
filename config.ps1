oh-my-posh init pwsh --config "C:\Users\<USERNAME>\Documents\Powershell\config.json" | Invoke-Expression

# Download best MP4 (H.264 + AAC preferred, fallback safe)
function ytdlpmp4 {
    yt-dlp -f "bestvideo[vcodec^=avc1]+bestaudio[acodec^=mp4a]/best[vcodec^=avc1]/bestvideo+bestaudio/best" --merge-output-format mp4 $args
}

# Download best MP3 (audio-only, highest quality)
function ytdlpmp3 {
    yt-dlp -f "bestaudio/best" --extract-audio --audio-format mp3 --audio-quality 0 $args
}

