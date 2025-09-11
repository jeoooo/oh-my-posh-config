oh-my-posh init pwsh --config "C:\Users\<USERNAME>\Documents\Powershell\config.json" | Invoke-Expression

function ytdlpmp4 {
    if (Get-Command yt-dlp -ErrorAction SilentlyContinue) {
        yt-dlp -f "bestvideo[vcodec^=avc1]+bestaudio[acodec^=mp4a]/best[vcodec^=avc1]/bestvideo+bestaudio/best" --merge-output-format mp4 $args
    } else {
        Write-Host "yt-dlp is not installed. Installing via winget..."
        winget install -e --id yt-dlp.yt-dlp
        if (Get-Command yt-dlp -ErrorAction SilentlyContinue) {
            yt-dlp -f "bestvideo[vcodec^=avc1]+bestaudio[acodec^=mp4a]/best[vcodec^=avc1]/bestvideo+bestaudio/best" --merge-output-format mp4 $args
        } else {
            Write-Host "yt-dlp installation failed. Please install manually: https://github.com/yt-dlp/yt-dlp"
        }
    }
}

# Download best MP3 (audio-only, highest quality)
function ytdlpmp3 {
    if (Get-Command yt-dlp -ErrorAction SilentlyContinue) {
        yt-dlp -f "bestaudio/best" --extract-audio --audio-format mp3 --audio-quality 0 $args
    } else {
        Write-Host "yt-dlp is not installed. Installing via winget..."
        winget install -e --id yt-dlp.yt-dlp
        if (Get-Command yt-dlp -ErrorAction SilentlyContinue) {
            yt-dlp -f "bestaudio/best" --extract-audio --audio-format mp3 --audio-quality 0 $args
        } else {
            Write-Host "yt-dlp installation failed. Please install manually: https://github.com/yt-dlp/yt-dlp"
        }
    }
}


