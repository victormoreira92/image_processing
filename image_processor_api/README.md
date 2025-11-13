# Image Processing Service

A robust image processing service providing a REST API for image manipulation, built with Ruby on Rails and Angular.

## 🚀 Features

- Image resizing
- Image compression 
- Image format conversion
- Brightness, contrast and saturation adjustments
- Image upload and download
- User-friendly web interface

## 🛠️ Technologies

### Backend (API)
- Ruby 3.1.4
- Rails 7.2.2
- PostgreSQL
- Active Storage for file storage
- ActionCable for real-time communication

### Frontend
- Angular 16
- TypeScript
- Bootstrap for styling
- RxJS for reactive programming

## 📋 Prerequisites

- Ruby 3.1.4
- Node.js 16+
- PostgreSQL
- ImageMagick

## 🔧 Installation

### API (Backend)

```bash
# Clone the repository
git clone https://github.com/your-username/image-processing-api

# Enter directory
cd image-processing-api

# Install dependencies
bundle install

# Setup database
rails db:create db:migrate

# Start server
rails s
```

### Frontend

```bash
# Enter frontend directory
cd image-processing_frontend

# Install dependencies
npm install

# Start development server
ng serve
```

## 🐋 Docker

The project includes Docker configuration for easy deployment:

```bash
# Build image
docker build -t image-processing-api .

# Run container
docker run -p 3000:3000 image-processing-api
```

## 📦 Project Structure

```
image-processing/
├── image_processing_api/    # Rails Backend
│   ├── app/
│   ├── config/
│   └── ...
└── image_processing_frontend/  # Angular Frontend
    ├── src/
    └── ...
```

## 🔍 API Endpoints

- `POST /api/images/upload` - Upload image
- `GET /api/images/:id` - Get processed image
- `PUT /api/images/:id/process` - Process image
- `DELETE /api/images/:id` - Remove image

## 👨‍💻 Development

To contribute to the project:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.