import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({Key? key}) : super(key: key);

static const String id  = 'AnimationScreen';

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  final _list = [];
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();
  void _addItem ()
  {
    _list.insert(0,'Item${_list.length +1}');
    _key.currentState!.insertItem(
        0,
      duration: const Duration(seconds: 1),
    );
  }

  void _removeItem (int index)
  {
    _key.currentState!.removeItem(
        index,
            (_, animation)
      {
        return SizeTransition(
          sizeFactor: animation,
          child: const Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Icon(Icons.face_retouching_off)
            ),
          ),
        );
      },
      duration:const Duration(milliseconds: 300),
    );
    _list.removeAt(index);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Animated List'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
          children: [
            const SizedBox(height: 10,),
            IconButton(
                onPressed: _addItem,
                icon: const Icon(Icons.add),
            ),
            Expanded(
                child: AnimatedList(
                  key: _key,
                  initialItemCount: 0,
                  padding:const EdgeInsets.all(10.0),
                  itemBuilder: (context,index,animation)
                  {
                    return SizeTransition(
                      key: UniqueKey(),
                        sizeFactor: animation,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('${_list[index]}',
                              style:const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: ()
                                {
                                  _removeItem(index);
                                },
                                icon: const Icon(Icons.delete,size: 24,color: Colors.white,),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
            ),
          ],
      ),
    );
  }
}
