# Authenticate to ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <account_id>.dkr.ecr.us-east-1.amazonaws.com

# Build and Push Flask
cd docker/flask
docker build -t flask-app .
docker tag flask-app:latest <flask_ecr_repo_url>
docker push <flask_ecr_repo_url>

# Build and Push Express
cd ../express
docker build -t express-app .
docker tag express-app:latest <express_ecr_repo_url>
docker push <express_ecr_repo_url>
