import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multitool/routes/routes.dart';
import 'package:multitool/widgets/bottom_nav_bar.dart';

class PomodoroPage extends StatefulWidget {
  const PomodoroPage({super.key});

  @override
  State<PomodoroPage> createState() => _PomodoroPageState();
}

class _PomodoroPageState extends State<PomodoroPage> {
  // Timer variables
  int _workMinutes = 25;
  int _breakMinutes = 5;
  int _secondsRemaining = 25 * 60;
  bool _isWorking = true;
  bool _isRunning = false;
  late String _currentStatus;

  @override
  void initState() {
    super.initState();
    _currentStatus = 'Work Time';
    _secondsRemaining = _workMinutes * 60;
  }

  void _startTimer() {
    setState(() {
      _isRunning = true;
    });
    _tick();
  }

  void _pauseTimer() {
    setState(() {
      _isRunning = false;
    });
  }

  void _resetTimer() {
    setState(() {
      _isRunning = false;
      _isWorking = true;
      _currentStatus = 'Work Time';
      _secondsRemaining = _workMinutes * 60;
    });
  }

  void _switchMode() {
    setState(() {
      _isWorking = !_isWorking;
      _currentStatus = _isWorking ? 'Work Time' : 'Break Time';
      _secondsRemaining = (_isWorking ? _workMinutes : _breakMinutes) * 60;
    });
  }

  void _tick() {
    if (!_isRunning) return;

    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;

      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
          _tick();
        } else {
          _isRunning = false;
          _switchMode();
          // Add vibration or sound notification here
        }
      });
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pomodoro Timer'),
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
        //     if (context.canPop()) {
        //       context.pop();
        //     } else {
        //       context.go(Routes.home);
        //     }
        //   },
        // ),
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _currentStatus,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              _formatTime(_secondsRemaining),
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!_isRunning)
                  ElevatedButton(
                    onPressed: _startTimer,
                    child: const Text('Start'),
                  )
                else
                  ElevatedButton(
                    onPressed: _pauseTimer,
                    child: const Text('Pause'),
                  ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _resetTimer,
                  child: const Text('Reset'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Settings section
            Card(
              margin: const EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text('Timer Settings',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Text('Work (min)'),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    if (_workMinutes > 1) {
                                      setState(() {
                                        _workMinutes--;
                                        if (_isWorking && !_isRunning) {
                                          _secondsRemaining = _workMinutes * 60;
                                        }
                                      });
                                    }
                                  },
                                ),
                                Text('$_workMinutes'),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      _workMinutes++;
                                      if (_isWorking && !_isRunning) {
                                        _secondsRemaining = _workMinutes * 60;
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text('Break (min)'),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    if (_breakMinutes > 1) {
                                      setState(() => _breakMinutes--);
                                    }
                                  },
                                ),
                                Text('$_breakMinutes'),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    setState(() => _breakMinutes++);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        
      ),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 0),
      
    );
  }
}
