FROM image-registry.openshift-image-registry.svc:5000/openshift/httpd:2.4-el8
COPY build/ /var/www/html/

COPY conf/httpd.conf /etc/httpd/conf/httpd.conf

#RUN chgrp -R 0 /var/log/httpd /var/run/httpd /etc/httpd /var/www/html \
#  && chmod -R g=u /var/log/httpd /var/run/httpd /etc/httpd /var/www/html 

EXPOSE 8080
USER 1001
CMD ["-D","FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]
