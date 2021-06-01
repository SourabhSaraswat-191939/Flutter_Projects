import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'category.dart';

// We use an underscore to indicate that these variables are private.
// See https://www.dartlang.org/guides/language/effective-dart/design#libraries
const _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

/// A [CategoryTile] to display a [Category].
class CategoryTile extends StatelessWidget {
  final Category category;
  final ValueChanged<Category> onTap;

  /// The [CategoryTile] shows the name and color of a [Category] for unit
  /// conversions.
  ///
  /// Tapping on it brings you to the unit converter.
  const CategoryTile({
    Key key,
    @required this.category,
    @required this.onTap,
  })  : assert(category != null),
        super(key: key);

  @override
  // This `context` parameter describes the location of this widget in the
  // widget tree. It can be used for obtaining Theme data from the nearest
  // Theme ancestor in the tree. Below, we obtain the display1 text theme.
  // See https://docs.flutter.io/flutter/material/Theme-class.html
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      padding: EdgeInsets.all(8),
      // decoration: BoxDecoration(
      //     border: Border.all(color: Colors.blue),
      //     borderRadius: BorderRadius.circular(50)),
      child: Center(
        child: InkWell(
            // splashColor: Colors.blue,
            // highlightColor: _tap_color.withOpacity(0.5),

            highlightColor: category.tapColor['highlight'],
            splashColor: category.tapColor['splash'],
            // radius: 55,  #for splashColor radius.
            borderRadius: BorderRadius.circular(50),
            // onTap: () => _navigateToConverter(context),
            onTap: () => onTap(category),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Image.asset(category.icon),
                ),
                Text(
                  category.name,
                  style: TextStyle(fontSize: 24),
                ),
              ],
            )),
      ),
    );
  }
}
