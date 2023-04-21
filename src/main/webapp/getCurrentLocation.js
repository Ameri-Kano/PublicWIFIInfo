// geolocation을 이용하여 현재 위치와 시간 가져오기
async function getCurrentLocation() {
    // geolocation을 이용하여 현재 위치와 시간 가져오기
    const currentLatitude = document.getElementById("currentLatitude");
    const currentLongitude = document.getElementById("currentLongitude");

    await window.navigator.geolocation.getCurrentPosition(function (p) {
            currentLatitude.value = p.coords.latitude;
            currentLongitude.value = p.coords.longitude;
        },
        function (e) {
            alert(e);
        }
    );
}