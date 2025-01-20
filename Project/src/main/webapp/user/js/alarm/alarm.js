document.addEventListener("DOMContentLoaded", function () {
    const tabs = document.querySelectorAll(".alarm-tabs .nav-link");
    const tables = document.querySelectorAll(".tab-content .table");

    tabs.forEach((tab) => {
        tab.addEventListener("click", function (e) {
            e.preventDefault();

            tabs.forEach((t) => t.classList.remove("active"));

            this.classList.add("active");

            tables.forEach((table) => table.classList.remove("show", "active"));

            const targetId = this.getAttribute("href").substring(1);
            const targetTable = document.getElementById(targetId);
            if (targetTable) {
                targetTable.classList.add("show", "active");
            }
        });
    });
});
