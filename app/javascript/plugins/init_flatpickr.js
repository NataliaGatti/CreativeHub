import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css"
import { Spanish } from "flatpickr/dist/l10n/es.js"


const initflatpickr = () => {
  flatpickr(".datepicker", {
    enableTime: true,
    dateFormat: "Y-m-d H:i",
    "locale": Spanish,
  });
};

export { initflatpickr };