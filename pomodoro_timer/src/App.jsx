import React, { useState, useEffect, useRef } from 'react';
import './App.css';

const SETTINGS = {
  WORK: 25 * 60,
  SHORT_BREAK: 5 * 60,
  LONG_BREAK: 15 * 60,
  SESSIONS_BEFORE_LONG_BREAK: 4
};

function App() {
  const [status, setStatus] = useState('IDLE');
  const [type, setType] = useState('WORK');
  const [timeRemaining, setTimeRemaining] = useState(SETTINGS.WORK);
  const [completedSessions, setCompletedSessions] = useState(0);
  
  const timerRef = useRef(null);
  const targetTimeRef = useRef(null);

  const formatTime = (seconds) => {
    const mins = Math.floor(seconds / 60);
    const secs = seconds % 60;
    return `${String(mins).padStart(2, '0')}:${String(secs).padStart(2, '0')}`;
  };

  useEffect(() => {
    if (status === 'RUNNING') {
      targetTimeRef.current = Date.now() + (timeRemaining * 1000);
      
      timerRef.current = setInterval(() => {
        const now = Date.now();
        const difference = Math.round((targetTimeRef.current - now) / 1000);

        if (difference <= 0) {
          handleEnd();
        } else {
          setTimeRemaining(difference);
        }
      }, 200);
    } else {
      clearInterval(timerRef.current);
    }
    return () => clearInterval(timerRef.current);
  }, [status]);

  const handleEnd = () => {
    clearInterval(timerRef.current);
    setStatus('IDLE');
    let nextType;
    let nextCount = completedSessions;

    if (type === 'WORK') {
      nextCount++;
      setCompletedSessions(nextCount);
      nextType = nextCount % SETTINGS.SESSIONS_BEFORE_LONG_BREAK === 0 ? 'LONG_BREAK' : 'SHORT_BREAK';
    } else {
      nextType = 'WORK';
    }

    setType(nextType);
    setTimeRemaining(SETTINGS[nextType]);
    alert(`${nextType.replace('_', ' ')} starts now!`);
  };

  const toggleTimer = () => {
    setStatus(prev => prev === 'RUNNING' ? 'PAUSED' : 'RUNNING');
  };

  const resetTimer = () => {
    setStatus('IDLE');
    setTimeRemaining(SETTINGS[type]);
  };

  const themeClass = `theme-${type.toLowerCase().replace('_', '-')}`;

  return (
    <div className={`app-wrapper ${themeClass}`}>
      <main className="container" role="main">
        <div className="status-card">
          <h2 aria-live="polite">{type.replace('_', ' ')}</h2>
          <p>Completed: {completedSessions}</p>
        </div>

        <div className="timer-card">
          <div className="timer-display" role="timer" aria-live="polite">
            {formatTime(timeRemaining)}
          </div>
          <div className="controls">
            <button onClick={toggleTimer} aria-label="Start or Pause Timer">
              {status === 'RUNNING' ? 'Pause' : (status === 'PAUSED' ? 'Resume' : 'Start')}
            </button>
            <button onClick={resetTimer} className="reset-btn" aria-label="Reset Timer">
              Reset
            </button>
          </div>
        </div>
      </main>
    </div>
  );
}

export default App;