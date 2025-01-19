function toggleText(element) {
    const ellipsisText = '... [더보기]';
    const fullText = element.getAttribute('data-full-text');

    if (element.textContent.trim().endsWith(ellipsisText)) {
        element.textContent = fullText;
    } else {
        const shortText = fullText.substring(0, 30) + ellipsisText;
        element.textContent = shortText;
    }
}