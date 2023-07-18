import React, { useState } from 'react';

function MainContent() {
  const [counter, setCounter] = useState(0);

  const handleIncrement = () => {
    setCounter(counter + 1);
  };

  return (
    <main>
      <section>
        <h2>Section 1</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
      </section>
      {/* Add other sections as needed */}
      <section>
        <h2>Counter Example</h2>
        <p>Current count: {counter}</p>
        <button onClick={handleIncrement}>Increment</button>
      </section>
    </main>
  );
}

export default MainContent;
