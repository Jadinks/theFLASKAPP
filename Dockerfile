FROM python : latest

COPY . .
RUN pip install -r requirements.txt
RUN wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -P /scripts
RUN chmod +x /scripts/wait-for-it.sh
ENTRYPOINT ["/scripts/wait-for-it.sh", "db:5432", "--"]
CMD ["python","app.py"]