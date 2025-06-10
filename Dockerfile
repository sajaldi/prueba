# Usamos una imagen ligera de Python 3.11
FROM python:3.11-slim

# No guardar archivos .pyc y mantener stdout/stderr legibles
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Establecemos el directorio de trabajo en el contenedor
WORKDIR /app

# Copiamos y actualizamos las dependencias
COPY requirements.txt /app/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copiamos el resto del proyecto al contenedor
COPY . /app/

# Ejecutamos gunicorn como servidor WSGI
CMD ["gunicorn", "prueba.wsgi:application", "--bind", "0.0.0.0:8000"]
