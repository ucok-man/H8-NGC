const panels = document.querySelectorAll(".panel");

panels.forEach((panel) => {
  panel.addEventListener("click", (e) => {
    removeLastActive();
    panel.classList.add("active");
  });
});

function removeLastActive() {
  const activePanel = document.querySelector(".panel.active");
  activePanel.classList.remove("active");
}
