document.addEventListener("DOMContentLoaded", function() {
    document.getElementById("loginForm").addEventListener("submit", async function(event) {
        event.preventDefault(); // Verhindert das Standardverhalten des Formulars

        const username = document.getElementById("username").value;
        const password = document.getElementById("password").value;

        const result = await login(username, password);
        document.getElementById("result").innerHTML = JSON.stringify(result);
    });
});

async function login(name, password) {
    const response = await fetch("/login", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({ name, password })
    });

    if (response.ok) {
        return response.json();
    } else {
        return response.json().then(json => Promise.reject(json));
    }
}
