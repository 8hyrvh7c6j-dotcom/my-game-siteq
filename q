
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>点击星星挑战</title>
<style>
* { box-sizing: border-box; }
body {
  margin: 0;
  min-height: 100vh;
  background: linear-gradient(145deg, #101b45, #6428a0);
  color: white;
  font-family: -apple-system, sans-serif;
  text-align: center;
}
main { padding: 25px 15px; }
h1 { font-size: 30px; }
.stats {
  display: flex;
  justify-content: center;
  gap: 25px;
  font-size: 18px;
}
button {
  border: 0;
  border-radius: 14px;
  padding: 14px 22px;
  font-size: 18px;
  font-weight: bold;
}
#start {
  background: #4ade80;
  color: #12301d;
}
#arena {
  position: relative;
  max-width: 440px;
  height: 360px;
  margin: 24px auto;
  border: 2px solid #ffffff55;
  border-radius: 22px;
  background: #ffffff12;
  overflow: hidden;
}
#star {
  position: absolute;
  display: none;
  width: 60px;
  height: 60px;
  padding: 0;
  border-radius: 50%;
  background: #fde047;
  font-size: 34px;
  box-shadow: 0 0 22px #fde04788;
  touch-action: manipulation;
}
#message { font-size: 17px; }
</style>
</head>
<body>
<main>
  <h1>⭐ 点击星星挑战</h1>
  <p>30 秒内，尽可能多地点击星星！</p>

  <div class="stats">
    <div>得分：<b id="score">0</b></div>
    <div id="time">时间：30 秒</div>
  </div>

  <p><button id="start">开始游戏</button></p>

  <div id="arena">
    <button id="star" aria-label="点击星星">⭐</button>
  </div>

  <p id="message">准备好了吗？点击开始！</p>
</main>

<script>
const start = document.getElementById("start");
const star = document.getElementById("star");
const arena = document.getElementById("arena");
const scoreEl = document.getElementById("score");
const timeEl = document.getElementById("time");
const message = document.getElementById("message");

let score = 0;
let remaining = 30;
let timer = null;
let playing = false;

function moveStar() {
  const maxX = arena.clientWidth - star.offsetWidth;
  const maxY = arena.clientHeight - star.offsetHeight;
  star.style.left = Math.random() * maxX + "px";
  star.style.top = Math.random() * maxY + "px";
}

function finishGame() {
  clearInterval(timer);
  timer = null;
  playing = false;
  star.style.display = "none";
  start.disabled = false;
  start.textContent = "再玩一次";
  message.textContent = "游戏结束！你获得了 " + score + " 分！";
}

start.addEventListener("click", () => {
  clearInterval(timer);
  score = 0;
  remaining = 30;
  playing = true;

  scoreEl.textContent = score;
  timeEl.textContent = "时间：30 秒";
  message.textContent = "快点击星星！";
  start.disabled = true;
  star.style.display = "block";
  moveStar();

  timer = setInterval(() => {
    remaining--;
    timeEl.textContent = "时间：" + remaining + " 秒";

    if (remaining <= 0) finishGame();
  }, 1000);
});

star.addEventListener("click", () => {
  if (!playing) return;
  score++;
  scoreEl.textContent = score;
  moveStar();
});
</script>
</body>
</html>
