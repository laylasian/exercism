## Replace YOUR-API-KEY below with your Excercism.io account API key

## The alias listed below for your .bash_profile assumes that you have tagged this build as exercism:v1.1
# alias d_exercism="docker run -it --rm --name docker-exercism -v $PWD:/var/html -w /var/html exercism:v1.1 /bin/exercism"
# You can then run exercism commands by typing d_exercism <command>
# e.g. d_exercism fetch python


FROM ubuntu:14.04
RUN apt-get update && apt-get install -y wget software-properties-common python-software-properties curl

RUN mkdir /var/html
WORKDIR /var/html

RUN wget -qO- https://github.com/exercism/cli/releases/download/v2.2.1/exercism-linux-64bit.tgz | tar -zx
RUN mv exercism /bin/ && chmod +x /bin/exercism
RUN exercism --version

RUN exercism configure --key=your-key-here
RUN exercism configure --dir=/var/html/

CMD ["bash"]

## everything above except my key from https://gist.github.com/stephenweigel/0a146486adb2422586aea38580ea7f5c
## running on my mac.... docker run -it --rm -v "$PWD"/var/html:/var/html exercism:v1.1
