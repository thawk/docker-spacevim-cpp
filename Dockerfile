# nvim with my SpaceVim configuration (https://github.com/thawk/dotspacevim)
#
# docker run -it --rm -P -v "$(pwd)":/src thawk/spacevim [<files to be edited>]

FROM thawk/spacevim-base:latest

ARG BUILD_DATE
ARG VCS_REF
ARG BOOST_VERSION=1.60.0
ARG BOOST_ARGS=

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/thawk/docker-spacevim-cpp.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0.0-rc1"

RUN true \
 && umask 0000 \
 && chmod -R a+rw $HOME/.config \
 && (find $HOME/.config -type d | xargs chmod a+rwx) \
 && true

# RUN true \
#  && cd $HOME \
#  && wget http://downloads.sourceforge.net/project/boost/boost/${BOOST_VERSION}/boost_${BOOST_VERSION//./_}.tar.bz2 \
#  && tar xf boost_${BOOST_VERSION//./_}.tar.bz2 \
#  && rm boost_${BOOST_VERSION//./_}.tar.bz2 \
#  && cd boost_${BOOST_VERSION//./_} \
#  && ./bootstrap.sh --prefix=/usr/local ${BOOST_ARGS} --with-libraries=program_options \
#  && ./b2 install \
#  && rm -rf boost_${BOOST_VERSION//./_} \
#  && true

WORKDIR /src
VOLUME /src

