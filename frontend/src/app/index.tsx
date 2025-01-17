import { createRoot } from 'react-dom/client';
import { BrowserRouter } from 'react-router-dom';

import { ErrorBoundary } from '@/components/ErrorBoundary';
import App from './App';

const container = document.getElementById('root');

if (!container) {
    throw new Error('Root container not found. Failed to mount React app');
}

const root = createRoot(container);

root.render(
        <BrowserRouter>
            <ErrorBoundary>
                <App />
            </ErrorBoundary>
        </BrowserRouter>
);