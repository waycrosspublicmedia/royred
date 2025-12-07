const originalFetch = window.fetch;

// Merge multiple parts of a file into a single Blob URL
function mergeFiles(fileParts) {
    return new Promise((resolve, reject) => {
        let buffers = [];

        function fetchPart(index) {
            if (index >= fileParts.length) {
                let mergedBlob = new Blob(buffers);
                let mergedFileUrl = URL.createObjectURL(mergedBlob);
                resolve(mergedFileUrl);
                return;
            }

            fetch(fileParts[index])
                .then((response) => {
                    if (!response.ok) throw new Error("Missing part: " + fileParts[index]);
                    return response.arrayBuffer();
                })
                .then((data) => {
                    buffers.push(data);
                    fetchPart(index + 1);
                })
                .catch(reject);
        }

        fetchPart(0);
    });
}

// Generate list of file parts
function getParts(file, start, end) {
    let parts = [];
    for (let i = start; i <= end; i++) {
        parts.push(file + ".part" + i);
    }
    return parts;
}

// Only merge WASM parts for awesome calculator
mergeFiles(getParts("awesome calculator.wasm", 1, 2)).then((wasmUrl) => {
    // Override fetch for the WASM file
    window.fetch = async function (url, ...args) {
        if (url.endsWith("awesome calculator.wasm")) {
            return originalFetch(wasmUrl, ...args);
        } else {
            return originalFetch(url, ...args);
        }
    };

    // Start the Godot game after merging
    window.godotRunStart();
}).catch(err => {
    console.error("Failed to merge WASM parts:", err);
});
