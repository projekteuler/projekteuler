window.MathJax = {
    jax: ["input/TeX", "output/HTML-CSS"],
    tex2jax: {
        inlineMath: [ ["$","$"], ["\\(","\\)"] ],
        displayMath: [ ["$$","$$"], ["\\[","\\]"] ],
        processEscapes: true,
        ignoreClass: "mathjax_ignore|diff"
    },
    "HTML-CSS": { availableFonts: ["TeX"] }
};