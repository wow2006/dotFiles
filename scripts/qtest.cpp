// Qt5
#include <QTest>
// Internal
{% for include in includes %}
#include "{{ include }}"
{% endfor %}

class {{ test_case }} : public QObject {
    Q_OBJECT

  private slots:
};

QTEST_MAIN({{ test_case }})
#include "{{test_case[0]|upper}}{{test_case[1:]}}.moc"
