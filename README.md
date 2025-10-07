# 🏛️ Samadhan AI - Government Complaint Management System

An intelligent, AI-powered platform for efficient government complaint management and citizen service delivery.

## 🌟 Features

### 🤖 AI-Powered Analysis
- Intelligent complaint categorization and priority assignment
- Automated department routing
- Sentiment analysis and response generation
- RAG (Retrieval Augmented Generation) system for contextual responses

### 📊 Real-Time Dashboard
- Live complaint tracking and analytics
- Department performance metrics
- Interactive charts and visualizations
- System load monitoring

### 🔍 Advanced Search
- Real-time search across complaints, departments, and services
- Intelligent filtering and relevance scoring
- Quick access to emergency services
- Popular search suggestions

### 📱 Modern UI/UX
- Responsive design for all devices
- Intuitive navigation and user experience
- Accessibility-compliant interface
- Real-time updates and notifications

## 🚀 Quick Start

### Prerequisites
- Python 3.8+
- Node.js 16+
- npm or yarn

### Backend Setup
```bash
cd flask-backend
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
python working_app.py
```

### Frontend Setup
```bash
npm install
npm run dev
```

### Access the Application
- Frontend: http://localhost:5173
- Backend API: http://localhost:5000

## 🏗️ Architecture

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   React Frontend │    │  Flask Backend  │    │   AI Services   │
│                 │    │                 │    │                 │
│ • Dashboard     │◄──►│ • REST API      │◄──►│ • LangChain RAG │
│ • Search        │    │ • Data Processing│    │ • Complaint AI  │
│ • Analytics     │    │ • Local Storage │    │ • Categorization│
│ • Complaints    │    │ • Fallback Mode │    │ • Sentiment     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 📁 Project Structure

```
samadhan-ai/
├── flask-backend/          # Python Flask API
│   ├── working_app.py      # Main application
│   ├── langchain_rag.py    # AI/RAG implementation
│   ├── supabase_client.py  # Database client
│   └── requirements.txt    # Python dependencies
├── src/                    # React frontend
│   ├── components/         # Reusable components
│   ├── pages/             # Page components
│   ├── hooks/             # Custom React hooks
│   └── lib/               # Utility libraries
├── public/                # Static assets
└── package.json           # Node.js dependencies
```

## 🛠️ Technology Stack

### Backend
- **Flask** - Web framework
- **LangChain** - AI/RAG implementation
- **Python** - Core language
- **Local Storage** - Data persistence

### Frontend
- **React** - UI framework
- **TypeScript** - Type safety
- **Tailwind CSS** - Styling
- **Framer Motion** - Animations
- **Recharts** - Data visualization

### AI/ML
- **LangChain** - RAG system
- **OpenAI** - Language models (optional)
- **FAISS** - Vector search
- **Sentence Transformers** - Embeddings

## 🎯 Key Components

### 1. Complaint Management
- Submit new complaints with AI categorization
- Real-time status tracking
- Automated department assignment
- Priority-based routing

### 2. Analytics Dashboard
- Live complaint metrics
- Department performance tracking
- Category distribution analysis
- Monthly trend visualization

### 3. Search & Discovery
- Intelligent search across all data
- Real-time results with relevance scoring
- Quick access to emergency services
- Popular search suggestions

### 4. AI Assistant
- Contextual response generation
- Government knowledge base integration
- Multi-language support (planned)
- Voice interaction (planned)

## 🔧 Configuration

### Environment Variables
```env
# Backend Configuration
FLASK_ENV=development
FLASK_DEBUG=True
PORT=5000

# AI Configuration (Optional)
OPENAI_API_KEY=your_openai_key_here
GEMINI_API_KEY=your_gemini_key_here

# Frontend Configuration
VITE_BACKEND_URL=http://localhost:5000
VITE_DISABLE_FIREBASE=true
VITE_USE_LOCAL_STORAGE=true
```

## 📈 Performance Features

- **Local Storage Fallback** - Works without external databases
- **Real-time Updates** - Live data synchronization
- **Responsive Design** - Optimized for all devices
- **Caching Strategy** - Efficient data loading
- **Error Handling** - Graceful failure recovery

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Built for IBM Hack Challenge 2025
- Inspired by Digital India initiatives
- Designed for citizen-centric governance

## 📞 Support

For support and queries:
- Create an issue on GitHub
- Email: support@samadhan-ai.com (placeholder)
- Documentation: [Wiki](../../wiki)

---

**Made with ❤️ for better governance and citizen services**