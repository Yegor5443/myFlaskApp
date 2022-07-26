.PHONY: requirements service

requirements:
	pip3 install -r /app/requirements.txt

service: requirements
	systemctl enable flaskApp \
    && systemctl start flaskApp \
    && systemctl restart nginx

