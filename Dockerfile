FROM archlinux:base-devel

RUN pacman -Syu --needed --noconfirm \
	&& rm -frv /var/cache/pacman/pkg/* \
	&& rm -frv /var/cache/pacman/sync/* \
	&& useradd -m -u 1000 ci \
	&& echo "ci ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ci

USER ci
WORKDIR /home/ci

CMD ["/usr/bin/bash"]
