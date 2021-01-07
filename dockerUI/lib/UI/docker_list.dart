import 'package:flutter/material.dart';

class MyDocker extends StatefulWidget {
  @override
  _MyDockerState createState() => _MyDockerState();
}

class _MyDockerState extends State<MyDocker> {
  var details = [
    {
      'title': 'Running Container',
      'subtitle': 'check docker running container',
      'image': 'assets/docker_container.jpg',
      'routing': 'DCrunning',
    },
    {
      'title': 'Start Container',
      'subtitle': 'start a stopped container',
      'image': 'assets/docker_container.jpg',
      'routing': 'DCstart',
    },
    {
      'title': 'Stop Container',
      'subtitle': 'Stop the running container',
      'image': 'assets/docker_container.jpg',
      'routing': 'DCstop',
    },
    {
      'title': 'Docker Images',
      'subtitle': 'See what are the docker images are available at server',
      'image': 'assets/docker_image.jpg',
      'routing': 'DIlist',
    },
    {
      'title': 'Launch a docker container',
      'subtitle': 'run a docker container',
      'image': 'assets/docker_container.jpg',
      'routing': 'DClaunch',
    },
    {
      'title': 'pull image from docker hub',
      'subtitle': 'pull the image from the docke hub',
      'image': 'assets/docker_image.jpg',
      'routing': 'DIpull',
    },
    {
      'title': 'Remove docker container',
      'subtitle': 'remove the docker container from server',
      'image': 'assets/docker_container.jpg',
      'routing': 'DCremove',
    },
    {
      'title': 'Remove docker images',
      'subtitle': 'remove the docker images from server',
      'image': 'assets/docker_image.jpg',
      'routing': 'DIremove',
    },
    {
      'title': 'Stopped Container',
      'subtitle': 'See all the stopped conatiner at server',
      'image': 'assets/docker_container.jpg',
      'routing': 'DCstopped',
    },
    {
      'title': 'Container Exec',
      'subtitle': 'Run any command inside docker container',
      'image': 'assets/docker_container.jpg',
      'routing': 'DCexec',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            child: Text(
              "Docker Operation",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: details.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 155,
                    child: Card(
                      color: index % 2 == 0 ? Colors.lightBlue : Colors.white,
                      child: ListTile(
                        onTap: () {
                          Navigator.pushNamed(
                              context, '${details[index]["routing"]}');
                        },
                        title: Text(
                          details[index]['title'],
                          style: TextStyle(
                              color:
                                  index % 2 == 0 ? Colors.white : Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(details[index]['subtitle'],
                              style: TextStyle(
                                fontSize: 20,
                                color: index % 2 == 0
                                    ? Colors.white
                                    : Colors.black,
                              )),
                        ),
                        trailing: Image.asset('${details[index]['image']}'),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
