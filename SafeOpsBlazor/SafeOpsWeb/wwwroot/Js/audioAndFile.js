// Audio playback function
window.playAudio = function (audioPath) {
  try {
    const audio = new Audio(audioPath);
    audio.play().catch((e) => console.log("Audio play failed:", e));
  } catch (error) {
    console.error("Error playing audio:", error);
  }
};

// File download function
window.downloadFileFromStream = function (fileName, base64Content) {
  try {
    // Convert base64 to blob
    const byteCharacters = atob(base64Content);
    const byteNumbers = new Array(byteCharacters.length);
    for (let i = 0; i < byteCharacters.length; i++) {
      byteNumbers[i] = byteCharacters.charCodeAt(i);
    }
    const byteArray = new Uint8Array(byteNumbers);
    const blob = new Blob([byteArray]);

    // Create download link
    const url = window.URL.createObjectURL(blob);
    const link = document.createElement("a");
    link.href = url;
    link.download = fileName;
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
    window.URL.revokeObjectURL(url);
  } catch (error) {
    console.error("Error downloading file:", error);
  }
};
