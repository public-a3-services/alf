# data-test-id

home: https://public-a3-services.github.io/data-test-id

## Chrome bookmarklet

### Procedure:

1. Create a new bookmark:
    - Right-click on the bookmarks bar and select `Add page`.
2. Set the name and URL:
    - `Name`: For example, "data-test-id"
    - `URL`: Paste the following code:

```javascript
javascript:(function() {
  const controlElements = ['button', 'input', 'a', 'select', 'textarea', 'form'];

  const elements = document.querySelectorAll(controlElements.join(', '));
  const allElements = document.querySelectorAll('*');
  let missingDataTestId = [];
  let hasDataTestId = [];
  let otherWithDataTestId = [];

  elements.forEach(el => {
    if (!el.hasAttribute('data-test-id')) {
      missingDataTestId.push({
        'tag': el.tagName.toLowerCase(),
        'id': el.id || '-',
        'class': el.className || '-',
        'text': el.innerText.trim().substring(0, 50) || '-',
        'element': el
      });
    } else {
      hasDataTestId.push({
        'tag': el.tagName.toLowerCase(),
        'id': el.id || '-',
        'class': el.className || '-',
        'text': el.innerText.trim().substring(0, 50) || '-',
        'data-test-id': el.getAttribute('data-test-id'),
        'element': el
      });
    }
  });

  Array.from(allElements).forEach(el => {
    if (el.hasAttribute('data-test-id')) {
      if (!hasDataTestId.some(item => item.element === el) && !Array.from(elements).includes(el)) {
        otherWithDataTestId.push({
          'tag': el.tagName.toLowerCase(),
          'id': el.id || '-',
          'class': el.className || '-',
          'text': el.innerText.trim().substring(0, 50) || '-',
          'data-test-id': el.getAttribute('data-test-id'),
          'element': el
        });
      }
    }
  });

  console.groupCollapsed('%c Control elements:', 'font-size: 20px; font-weight: bold; color: purple;');
  console.log(controlElements);
  console.groupEnd();

  console.groupCollapsed(`%c Missing control data-test-id selector (${missingDataTestId.length})`, 'font-size: 16px; font-weight: bold; color: red;');
  console.table(missingDataTestId);
  console.groupEnd();

  console.groupCollapsed(`%c Control elements with data-test-id selector (${hasDataTestId.length})`, 'font-size: 16px; font-weight: bold; color: green;');
  console.table(hasDataTestId);
  console.groupEnd();

  console.groupCollapsed(`%c Other elements with data-test-id selector (${otherWithDataTestId.length})`, 'font-size: 16px; font-weight: bold; color: blue;');
  console.table(otherWithDataTestId);
  console.groupEnd();
})();
```

### Example websites to test:

- [example1.html](example1.html)
- [example2.html](example2.html)
- [example3.html](example3.html)
- [example4.html](example4.html)
- [example5.html](example5.html)
