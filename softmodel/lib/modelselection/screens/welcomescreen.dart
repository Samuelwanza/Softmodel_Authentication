import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ModelSelectionHomePage extends StatefulWidget {
  const ModelSelectionHomePage({super.key});

  @override
  State<ModelSelectionHomePage> createState() => _ModelSelectionHomePageState();
}

class _ModelSelectionHomePageState extends State<ModelSelectionHomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );
  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

  bool _showButton = false;

  @override
  void initState() {
    super.initState();
    _controller.forward();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _showButton = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image:
              AssetImage(r"lib\modelselection\assets\images\welcomeback.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Center(
              child: Text('Model Selection'),
            ),
            backgroundColor: const Color(0xfffbc108),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ScaleTransition(
                          scale: _animation,
                          child: Text(
                            'W',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.25,
                              color: const Color(0xff072f53),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: ScaleTransition(
                              scale: _animation,
                              child: Text(
                                'elcome to Model Selection Test!',
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.03,
                                  color: const Color(0xff072f53),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ScaleTransition(
                      scale: _animation,
                      child: SvgPicture.asset(
                        r'lib\modelselection\assets\images\function.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  if (_showButton)
                    Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: ElevatedButton(
                        onPressed: () {
                          // add function to run when button is pressed
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color(0xff072f53),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 0,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            'Start Test',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          )),
    );
  }
}
