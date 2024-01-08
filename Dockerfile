# Utilisation d'une image de base contenant Node.js
FROM node:14-alpine
# Définir le répertoire de travail dans le conteneur
WORKDIR /app
# Copier tous les fichiers du répertoire actuel dans le conteneur
COPY . /app
# Copier les fichiers du projet dans le conteneur
COPY package.json package-lock.json ./
# Installer les dépendances
RUN npm install
RUN npm cache clean --force
# Exposer le port 3000 utilisé par l'application React
EXPOSE 3000
# Commande pour démarrer l'application React
CMD ["npm", "start"]

